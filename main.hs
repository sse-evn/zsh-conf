import Data.List (nub)
import qualified Data.Map as Map

-- Представление графа с помощью списка смежности
type Graph = Map.Map Int [Int]

-- Алгоритм поиска в глубину (DFS)
dfs :: Graph -> Int -> [Int] -> [Int]
dfs graph node visited
  | node `elem` visited = visited
  | otherwise = foldl (\v n -> dfs graph n v) (node:visited) (graph Map.! node)

-- Нахождение компонент связности в графе
findConnectedComponents :: Graph -> [[Int]]
findConnectedComponents graph = findComponents graph [] (Map.keys graph)
  where
    findComponents _ visited [] = map (nub . reverse) visited
    findComponents graph visited (x:xs)
      | any (elem x) visited = findComponents graph visited xs
      | otherwise = let component = dfs graph x [] in
                    findComponents graph (component:visited) (xs \\ component)

-- Пример графа
exampleGraph :: Graph
exampleGraph = Map.fromList [
    (1, [2, 3]),
    (2, [1, 4]),
    (3, [1]),
    (4, [2]),
    (5, [6]),
    (6, [5])
  ]

-- Главная функция
main :: IO ()
main = do
  let components = findConnectedComponents exampleGraph
  putStrLn "Components:"
  mapM_ print components

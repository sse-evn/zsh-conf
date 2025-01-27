#!/usr/bin/perl
use strict;
use warnings;

# Основной цикл программы
while (1) {
    print "Enter command: ";
    chomp(my $command = <STDIN>);  # Чтение команды с ввода пользователя

    # Прерывание программы, если команда "exit"
    if ($command eq "exit") {
        print "Exiting program...\n";
        last;
    }

    # Выполнение команды "add", выполняет сложение двух чисел
    if ($command =~ /^add (\d+) (\d+)$/) {
        my $result = $1 + $2;
        print "Result: $result\n";
    }
    # Выполнение команды "subtract", выполняет вычитание двух чисел
    elsif ($command =~ /^subtract (\d+) (\d+)$/) {
        my $result = $1 - $2;
        print "Result: $result\n";
    }
    # Выполнение команды "multiply", выполняет умножение двух чисел
    elsif ($command =~ /^multiply (\d+) (\d+)$/) {
        my $result = $1 * $2;
        print "Result: $result\n";
    }
    # Выполнение команды "divide", выполняет деление двух чисел
    elsif ($command =~ /^divide (\d+) (\d+)$/) {
        if ($2 == 0) {
            print "Error: Division by zero\n";
        } else {
            my $result = $1 / $2;
            print "Result: $result\n";
        }
    }
    # Команда "createfile" создаст файл с переданным именем и текстом
    elsif ($command =~ /^createfile (\S+) (.+)$/) {
        my $filename = $1;
        my $content = $2;
        open my $fh, '>', $filename or die "Could not open file '$filename' $!\n";
        print $fh $content;
        close $fh;
        print "File '$filename' created successfully.\n";
    }
    # Если введена неверная команда
    else {
        print "Unknown command: $command\n";
    }
}

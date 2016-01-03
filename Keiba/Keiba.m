function Keiba()

clear
clc

[Number_0, Name_0, Jockie_0, Weight_0, Popularity_0, Odds_0] = ImportRaceInfo('G1Arimakinen_2015.csv');

disp('[�o���n]');
for i = 1:size(Number_0, 1)
    fprintf('%d, %s\n', Number_0(i), char(Name_0(i)));
end
disp('[���ʗ\�z]');
disp('1.����5������');
disp('2.����10������');
disp('3.����5�����ʁi�O���[�h�l���j');
disp('4.����10�����ʁi�O���[�h�l���j');
disp('5.����5�����ϑ��x');
disp('6.����10�����ϑ��x');
disp('7.����5���l�C');
disp('8.����10���l�C');
type = input('�|�\�z�^�C�v:');
disp('[�\�z����]');

switch type
    case 1
        Prospect = zeros(size(Number_0, 1), 1);
        Reason = zeros(size(Number_0, 1), 1);
        for i = 1:size(Number_0, 1)
            data_name = ['G1results_', char(Name_0(i)), '_2015.csv'];
            [date, race, rank, place, ground, length, all, number, popularity, odds, results, jockie, weight, time] = ImportHorseInfo(data_name);
            if size(results,1) > 5
                Reason(i) = sum(results(1:5))/5;
            else
                Reason(i) = sum(results)/5;
            end
        end
        Reason_tmp = Reason;
        for i = 1:size(Number_0, 1)
            [value, index] = min(Reason_tmp);
            Prospect(index) = i;
            Reason_tmp(index) = Inf;
        end
        for i = 1:size(Number_0, 1)
            fprintf('�n��%d:\t�\�z%d�� \t%s\n', Number_0(i), Prospect(i), char(Name_0(i)));
        end
    case 2
        Prospect = zeros(size(Number_0, 1), 1);
        Reason = zeros(size(Number_0, 1), 1);
        for i = 1:size(Number_0, 1)
            data_name = ['G1results_', char(Name_0(i)), '_2015.csv'];
            [date, race, rank, place, ground, length, all, number, popularity, odds, results, jockie, weight, time] = ImportHorseInfo(data_name);
            if size(results,1) > 10
                Reason(i) = sum(results(1:10))/10;
            else
                Reason(i) = sum(results)/10;
            end
        end
        Reason_tmp = Reason;
        for i = 1:size(Number_0, 1)
            [value, index] = min(Reason_tmp);
            Prospect(index) = i;
            Reason_tmp(index) = Inf;
        end
        for i = 1:size(Number_0, 1)
            fprintf('�n��%d:\t�\�z%d�� \t%s\n', Number_0(i), Prospect(i), char(Name_0(i)));
        end
    case 3
        Prospect = zeros(size(Number_0, 1), 1);
        Reason = zeros(size(Number_0, 1), 1);
        for i = 1:size(Number_0, 1)
            data_name = ['G1results_', char(Name_0(i)), '_2015.csv'];
            [date, race, rank, place, ground, length, all, number, popularity, odds, results, jockie, weight, time] = ImportHorseInfo(data_name);
            for j = 1:5
                if strcmp(char(rank(j)), 'G2')
                    results(j) = results(j) * 1.2;
                elseif strcmp(char(rank(j)), 'G3')
                    results(j) = results(j) * 1.4;
                elseif strcmp(char(rank(j)), 'NULL')
                    results(j) = results(j) * 1.8;
                end
                if j == size(results, 1)
                    break;
                end
            end
            if size(results,1) > 5
                Reason(i) = sum(results(1:5))/5;
            else
                Reason(i) = sum(results)/5;
            end
        end
        Reason_tmp = Reason;
        for i = 1:size(Number_0, 1)
            [value, index] = min(Reason_tmp);
            Prospect(index) = i;
            Reason_tmp(index) = Inf;
        end
        for i = 1:size(Number_0, 1)
            fprintf('�n��%d:\t�\�z%d�� \t%s\n', Number_0(i), Prospect(i), char(Name_0(i)));
        end
    case 4
        Prospect = zeros(size(Number_0, 1), 1);
        Reason = zeros(size(Number_0, 1), 1);
        for i = 1:size(Number_0, 1)
            data_name = ['G1results_', char(Name_0(i)), '_2015.csv'];
            [date, race, rank, place, ground, length, all, number, popularity, odds, results, jockie, weight, time] = ImportHorseInfo(data_name);
            for j = 1:10
                if strcmp(char(rank(j)), 'G2')
                    results(j) = results(j) * 1.2;
                elseif strcmp(char(rank(j)), 'G3')
                    results(j) = results(j) * 1.4;
                elseif strcmp(char(rank(j)), 'NULL')
                    results(j) = results(j) * 1.8;
                end
                if j == size(results, 1)
                    break;
                end
            end
            if size(results,1) > 10
                Reason(i) = sum(results(1:10))/10;
            else
                Reason(i) = sum(results)/10;
            end
        end
        Reason_tmp = Reason;
        for i = 1:size(Number_0, 1)
            [value, index] = min(Reason_tmp);
            Prospect(index) = i;
            Reason_tmp(index) = Inf;
        end
        for i = 1:size(Number_0, 1)
            fprintf('�n��%d:\t�\�z%d�� \t%s\n', Number_0(i), Prospect(i), char(Name_0(i)));
        end
    case 5
        Prospect = zeros(size(Number_0, 1), 1);
        Reason = zeros(size(Number_0, 1), 1);
        for i = 1:size(Number_0, 1)
            data_name = ['G1results_', char(Name_0(i)), '_2015.csv'];
            [date, race, rank, place, ground, length, all, number, popularity, odds, results, jockie, weight, time] = ImportHorseInfo(data_name);
            speed = length./time;
            if size(speed,1) > 5
                Reason(i) = sum(speed(1:5))/5;
            else
                Reason(i) = sum(speed)/5;
            end
        end
        Reason_tmp = Reason;
        for i = 1:size(Number_0, 1)
            [value, index] = min(Reason_tmp);
            Prospect(index) = i;
            Reason_tmp(index) = Inf;
        end
        for i = 1:size(Number_0, 1)
            fprintf('�n��%d:\t�\�z%d�� \t%s\n', Number_0(i), Prospect(i), char(Name_0(i)));
        end
    case 6
        Prospect = zeros(size(Number_0, 1), 1);
        Reason = zeros(size(Number_0, 1), 1);
        for i = 1:size(Number_0, 1)
            data_name = ['G1results_', char(Name_0(i)), '_2015.csv'];
            [date, race, rank, place, ground, length, all, number, popularity, odds, results, jockie, weight, time] = ImportHorseInfo(data_name);
            speed = length./time;
            if size(speed,1) > 10
                Reason(i) = sum(speed(1:10))/10;
            else
                Reason(i) = sum(speed)/10;
            end
        end
        Reason_tmp = Reason;
        for i = 1:size(Number_0, 1)
            [value, index] = min(Reason_tmp);
            Prospect(index) = i;
            Reason_tmp(index) = Inf;
        end
        for i = 1:size(Number_0, 1)
            fprintf('�n��%d:\t�\�z%d�� \t%s\n', Number_0(i), Prospect(i), char(Name_0(i)));
        end
    case 7
        Prospect = zeros(size(Number_0, 1), 1);
        Reason = zeros(size(Number_0, 1), 1);
        for i = 1:size(Number_0, 1)
            data_name = ['G1results_', char(Name_0(i)), '_2015.csv'];
            [date, race, rank, place, ground, length, all, number, popularity, odds, results, jockie, weight, time] = ImportHorseInfo(data_name);
            if size(popularity,1) > 5
                Reason(i) = sum(popularity(1:5))/5;
            else
                Reason(i) = sum(popularity)/5;
            end
        end
        Reason_tmp = Reason;
        for i = 1:size(Number_0, 1)
            [value, index] = min(Reason_tmp);
            Prospect(index) = i;
            Reason_tmp(index) = Inf;
        end
        for i = 1:size(Number_0, 1)
            fprintf('�n��%d:\t�\�z%d�� \t%s\n', Number_0(i), Prospect(i), char(Name_0(i)));
        end
    case 8
        Prospect = zeros(size(Number_0, 1), 1);
        Reason = zeros(size(Number_0, 1), 1);
        for i = 1:size(Number_0, 1)
            data_name = ['G1results_', char(Name_0(i)), '_2015.csv'];
            [date, race, rank, place, ground, length, all, number, popularity, odds, results, jockie, weight, time] = ImportHorseInfo(data_name);
            if size(popularity,1) > 10
                Reason(i) = sum(popularity(1:10))/10;
            else
                Reason(i) = sum(popularity)/10;
            end
        end
        Reason_tmp = Reason;
        for i = 1:size(Number_0, 1)
            [value, index] = min(Reason_tmp);
            Prospect(index) = i;
            Reason_tmp(index) = Inf;
        end
        for i = 1:size(Number_0, 1)
            fprintf('�n��%d:\t�\�z%d�� \t%s\n', Number_0(i), Prospect(i), char(Name_0(i)));
        end
    otherwise
        warning('Unexpected type.')
end

end
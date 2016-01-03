function Keiba()

clear
clc

[Number_0, Name_0, Jockie_0, Weight_0, Popularity_0, Odds_0] = ImportRaceInfo('G1Arimakinen_2015.csv');

disp('[出走馬]');
for i = 1:size(Number_0, 1)
    fprintf('%d, %s\n', Number_0(i), char(Name_0(i)));
end
disp('[順位予想]');
disp('1.直近5走順位');
disp('2.直近10走順位');
disp('3.直近5走順位（グレード考慮）');
disp('4.直近10走順位（グレード考慮）');
disp('5.直近5走平均速度');
disp('6.直近10走平均速度');
disp('7.直近5走人気');
disp('8.直近10走人気');
type = input('－予想タイプ:');
disp('[予想結果]');

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
            fprintf('馬番%d:\t予想%d着 \t%s\n', Number_0(i), Prospect(i), char(Name_0(i)));
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
            fprintf('馬番%d:\t予想%d着 \t%s\n', Number_0(i), Prospect(i), char(Name_0(i)));
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
            fprintf('馬番%d:\t予想%d着 \t%s\n', Number_0(i), Prospect(i), char(Name_0(i)));
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
            fprintf('馬番%d:\t予想%d着 \t%s\n', Number_0(i), Prospect(i), char(Name_0(i)));
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
            fprintf('馬番%d:\t予想%d着 \t%s\n', Number_0(i), Prospect(i), char(Name_0(i)));
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
            fprintf('馬番%d:\t予想%d着 \t%s\n', Number_0(i), Prospect(i), char(Name_0(i)));
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
            fprintf('馬番%d:\t予想%d着 \t%s\n', Number_0(i), Prospect(i), char(Name_0(i)));
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
            fprintf('馬番%d:\t予想%d着 \t%s\n', Number_0(i), Prospect(i), char(Name_0(i)));
        end
    otherwise
        warning('Unexpected type.')
end

end
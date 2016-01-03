function [Date,Race,Rank,Place,Ground,Length1,All,Number,Popularity1,Odds1,Results1,Jockie,Weight,Time1] = ImportHorseInfo(filename, startRow, endRow)
%IMPORTFILE1 テキスト ファイルから数値データを列ベクトルとしてインポートします。
%   [DATE,RACE,RANK,PLACE,GROUND,LENGTH1,ALL,NUMBER,POPULARITY1,ODDS1,RESULTS1,JOCKIE,WEIGHT,TIME1]
%   = IMPORTFILE1(FILENAME) 既定の選択については テキスト ファイル FILENAME からデータを読み取ります。
%
%   [DATE,RACE,RANK,PLACE,GROUND,LENGTH1,ALL,NUMBER,POPULARITY1,ODDS1,RESULTS1,JOCKIE,WEIGHT,TIME1]
%   = IMPORTFILE1(FILENAME, STARTROW, ENDROW) テキスト ファイル FILENAME の STARTROW
%   行から ENDROW 行までのデータを読み取ります。
%
% Example:
%   [Date,Race,Rank,Place,Ground,Length1,All,Number,Popularity1,Odds1,Results1,Jockie,Weight,Time1] = importfile1('G1results_LastImpact_2015.csv',2, 11);
%
%    TEXTSCAN も参照してください。

% MATLAB による自動生成 2016/01/03 10:31:11

%% 変数を初期化します。
delimiter = ',';
if nargin<=2
    startRow = 2;
    endRow = inf;
end

%% テキストの各行の書式文字列:
%   列1: double (%f)
%	列2: テキスト (%s)
%   列3: テキスト (%s)
%	列4: テキスト (%s)
%   列5: テキスト (%s)
%	列6: double (%f)
%   列7: double (%f)
%	列8: double (%f)
%   列9: double (%f)
%	列10: double (%f)
%   列11: double (%f)
%	列12: テキスト (%s)
%   列13: double (%f)
%	列14: double (%f)
% 詳細は TEXTSCAN のドキュメンテーションを参照してください。
formatSpec = '%f%s%s%s%s%f%f%f%f%f%f%s%f%f%[^\n\r]';

%% テキスト ファイルを開きます。
fileID = fopen(filename,'r');

%% データの列を書式文字列に従って読み取ります。
% この呼び出しは、このコードの生成に使用されたファイルの構造に基づいています。別のファイルでエラーが発生する場合は、インポート
% ツールからコードの再生成を試みてください。
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'HeaderLines', startRow(1)-1, 'ReturnOnError', false);
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'HeaderLines', startRow(block)-1, 'ReturnOnError', false);
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end

%% テキスト ファイルを閉じます。
fclose(fileID);

%% インポートできないデータの後処理。
% インポート中に、インポートできないデータの規則が適用されなかったため、後処理コードが含まれていません。インポートできないデータに適用できるコードを生成するには、ファイル内のインポートできないセルを選択してからスクリプトを再生成します。

%% インポートした配列を列変数名に割り当てます
Date = dataArray{:, 1};
Race = dataArray{:, 2};
Rank = dataArray{:, 3};
Place = dataArray{:, 4};
Ground = dataArray{:, 5};
Length1 = dataArray{:, 6};
All = dataArray{:, 7};
Number = dataArray{:, 8};
Popularity1 = dataArray{:, 9};
Odds1 = dataArray{:, 10};
Results1 = dataArray{:, 11};
Jockie = dataArray{:, 12};
Weight = dataArray{:, 13};
Time1 = dataArray{:, 14};



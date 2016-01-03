function [Number,Name,Jockie,Weight,Popularity,Odds] = ImportRaceInfo(filename, startRow, endRow)
%IMPORTFILE1 テキスト ファイルから数値データを列ベクトルとしてインポートします。
%   [NUMBER,NAME,JOCKIE,WEIGHT,POPULARITY,ODDS] = IMPORTFILE1(FILENAME)
%   既定の選択については テキスト ファイル FILENAME からデータを読み取ります。
%
%   [NUMBER,NAME,JOCKIE,WEIGHT,POPULARITY,ODDS] = IMPORTFILE1(FILENAME,
%   STARTROW, ENDROW) テキスト ファイル FILENAME の STARTROW 行から ENDROW
%   行までのデータを読み取ります。
%
% Example:
%   [Number,Name,Jockie,Weight,Popularity,Odds] = importfile1('G1Arimakinen_2015.csv',2, 17);
%
%    TEXTSCAN も参照してください。

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
%	列4: double (%f)
%   列5: double (%f)
%	列6: double (%f)
% 詳細は TEXTSCAN のドキュメンテーションを参照してください。
formatSpec = '%f%s%s%f%f%f%[^\n\r]';

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
Number = dataArray{:, 1};
Name = dataArray{:, 2};
Jockie = dataArray{:, 3};
Weight = dataArray{:, 4};
Popularity = dataArray{:, 5};
Odds = dataArray{:, 6};



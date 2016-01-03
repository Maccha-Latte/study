function [Number,Name,Jockie,Weight,Popularity,Odds] = ImportRaceInfo(filename, startRow, endRow)
%IMPORTFILE1 �e�L�X�g �t�@�C�����琔�l�f�[�^���x�N�g���Ƃ��ăC���|�[�g���܂��B
%   [NUMBER,NAME,JOCKIE,WEIGHT,POPULARITY,ODDS] = IMPORTFILE1(FILENAME)
%   ����̑I���ɂ��Ă� �e�L�X�g �t�@�C�� FILENAME ����f�[�^��ǂݎ��܂��B
%
%   [NUMBER,NAME,JOCKIE,WEIGHT,POPULARITY,ODDS] = IMPORTFILE1(FILENAME,
%   STARTROW, ENDROW) �e�L�X�g �t�@�C�� FILENAME �� STARTROW �s���� ENDROW
%   �s�܂ł̃f�[�^��ǂݎ��܂��B
%
% Example:
%   [Number,Name,Jockie,Weight,Popularity,Odds] = importfile1('G1Arimakinen_2015.csv',2, 17);
%
%    TEXTSCAN ���Q�Ƃ��Ă��������B

%% �ϐ������������܂��B
delimiter = ',';
if nargin<=2
    startRow = 2;
    endRow = inf;
end

%% �e�L�X�g�̊e�s�̏���������:
%   ��1: double (%f)
%	��2: �e�L�X�g (%s)
%   ��3: �e�L�X�g (%s)
%	��4: double (%f)
%   ��5: double (%f)
%	��6: double (%f)
% �ڍׂ� TEXTSCAN �̃h�L�������e�[�V�������Q�Ƃ��Ă��������B
formatSpec = '%f%s%s%f%f%f%[^\n\r]';

%% �e�L�X�g �t�@�C�����J���܂��B
fileID = fopen(filename,'r');

%% �f�[�^�̗������������ɏ]���ēǂݎ��܂��B
% ���̌Ăяo���́A���̃R�[�h�̐����Ɏg�p���ꂽ�t�@�C���̍\���Ɋ�Â��Ă��܂��B�ʂ̃t�@�C���ŃG���[����������ꍇ�́A�C���|�[�g
% �c�[������R�[�h�̍Đ��������݂Ă��������B
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'HeaderLines', startRow(1)-1, 'ReturnOnError', false);
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'HeaderLines', startRow(block)-1, 'ReturnOnError', false);
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end

%% �e�L�X�g �t�@�C������܂��B
fclose(fileID);

%% �C���|�[�g�ł��Ȃ��f�[�^�̌㏈���B
% �C���|�[�g���ɁA�C���|�[�g�ł��Ȃ��f�[�^�̋K�����K�p����Ȃ��������߁A�㏈���R�[�h���܂܂�Ă��܂���B�C���|�[�g�ł��Ȃ��f�[�^�ɓK�p�ł���R�[�h�𐶐�����ɂ́A�t�@�C�����̃C���|�[�g�ł��Ȃ��Z����I�����Ă���X�N���v�g���Đ������܂��B

%% �C���|�[�g�����z����ϐ����Ɋ��蓖�Ă܂�
Number = dataArray{:, 1};
Name = dataArray{:, 2};
Jockie = dataArray{:, 3};
Weight = dataArray{:, 4};
Popularity = dataArray{:, 5};
Odds = dataArray{:, 6};



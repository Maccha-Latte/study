function [Date,Race,Rank,Place,Ground,Length1,All,Number,Popularity1,Odds1,Results1,Jockie,Weight,Time1] = ImportHorseInfo(filename, startRow, endRow)
%IMPORTFILE1 �e�L�X�g �t�@�C�����琔�l�f�[�^���x�N�g���Ƃ��ăC���|�[�g���܂��B
%   [DATE,RACE,RANK,PLACE,GROUND,LENGTH1,ALL,NUMBER,POPULARITY1,ODDS1,RESULTS1,JOCKIE,WEIGHT,TIME1]
%   = IMPORTFILE1(FILENAME) ����̑I���ɂ��Ă� �e�L�X�g �t�@�C�� FILENAME ����f�[�^��ǂݎ��܂��B
%
%   [DATE,RACE,RANK,PLACE,GROUND,LENGTH1,ALL,NUMBER,POPULARITY1,ODDS1,RESULTS1,JOCKIE,WEIGHT,TIME1]
%   = IMPORTFILE1(FILENAME, STARTROW, ENDROW) �e�L�X�g �t�@�C�� FILENAME �� STARTROW
%   �s���� ENDROW �s�܂ł̃f�[�^��ǂݎ��܂��B
%
% Example:
%   [Date,Race,Rank,Place,Ground,Length1,All,Number,Popularity1,Odds1,Results1,Jockie,Weight,Time1] = importfile1('G1results_LastImpact_2015.csv',2, 11);
%
%    TEXTSCAN ���Q�Ƃ��Ă��������B

% MATLAB �ɂ�鎩������ 2016/01/03 10:31:11

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
%	��4: �e�L�X�g (%s)
%   ��5: �e�L�X�g (%s)
%	��6: double (%f)
%   ��7: double (%f)
%	��8: double (%f)
%   ��9: double (%f)
%	��10: double (%f)
%   ��11: double (%f)
%	��12: �e�L�X�g (%s)
%   ��13: double (%f)
%	��14: double (%f)
% �ڍׂ� TEXTSCAN �̃h�L�������e�[�V�������Q�Ƃ��Ă��������B
formatSpec = '%f%s%s%s%s%f%f%f%f%f%f%s%f%f%[^\n\r]';

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



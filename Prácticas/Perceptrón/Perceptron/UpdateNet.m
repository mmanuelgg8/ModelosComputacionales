function [nuevoW] = UpdateNet(W,LR,Output,Target,Input)
%UPDATENET Summary of this function goes here
%   Detailed explanation goes here
difW=LR*(Target-Output).*[Input -1];

nuevoW=W+difW';

end


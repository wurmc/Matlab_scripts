% (c) 2006, stefanv@upb.de
% confdelta(x,c,dim) computes confidence deltas (cd) using standard
% equations of a SINGLE vector x* assuming i.i. normal distributed 
% sample values and enough values to calculate variance
%
% confidence interval is then from mean(x*)-cd to mean(x*)+cd
%
% provide the following values:
% x matrix to analyze
% c confidence value, e.g. 1.96 for 95% or 2.576 for 99% confidence
% dim matrix dimension to analyze, e.g. 1 for rows, 2 for columns
%
function cd=confdelta(x,c,dim)

cd=c.*std(x,0,dim)./sqrt(size(x,dim));

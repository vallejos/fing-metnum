%% MSE(Mean Square Error)
% Author      : Niya
% Date        : 2011/02/16
% Status      : OK
% Description : This function used to caculate the MSE.
% Parameters  : oriImg    -> the original signal (used to define the signal area) 
%               signalImg -> the reconstructed signal from the hologram
%               mse       ->the calculated MSE
% Notes       : 
function mse = mse(origImg, distImg)
    origImg = double(origImg);
    distImg = double(distImg);

    [M N] = size(origImg);
    error = origImg - distImg;
    mse = sum(sum(error.^2)) / (M*N);
end


%% MyMainScript

img = load('../data/barbara.mat');
img = img.imageOrig;
noise = randn(size(img, 1)) * 0.05 * max(max(img));
imgn = max(0, img+noise);

s = [1:5:100];
logger = zeros([numel(s) 2]);
parfor x = 1:numel(s)
        disp(x)
        tic;
        im_new = patchbased(imgn, s(x), 9, 25);
        logger(x, 1) = rmsd(img, im_new);
		imwrite(im_new, strcat('benchmark/', num2str(s(x)), '_barbara.png'));
end

save('benchmark/workspace.mat');

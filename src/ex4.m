d95a2 = imread('../in_img/Imatges2/d95a2.tif');
d95 = imread('../in_img/Imatges2/d95.bmp');
lena_low = imread('../in_img/Imatges2/lena_low.png');
lena_low_bn = imread('../in_img/Imatges2/Lenna_bn.png');

% 4.1 Canny
detect_edges(d95, '../out_img/ex4/d95_canny.png', 'canny', 0.5);
detect_edges(d95a2, '../out_img/ex4/d95a2_canny.png', 'canny', 0.2);
detect_edges(lena_low, '../out_img/ex4/lena_low_canny.png', 'canny', 0.1);
detect_edges(lena_low_bn, '../out_img/ex4/lena_low_bn_canny.png', 'canny', 0.2);

% 4.2 Roberts, Prewitt, LoG, nothinning
detect_edges(d95, '../out_img/ex4/d95_roberts.png', 'Roberts', 0.06);
detect_edges(d95, '../out_img/ex4/d95_prewitt.png', 'Prewitt', 0.05);
detect_edges(d95, '../out_img/ex4/d95_log.png', 'log', 0.005);

detect_edges_nothinning(d95, '../out_img/ex4/d95_nothinning.png');

function dst = detect_edges(src, dst_path, f, threshold)
    if numel(size(src))>=3
        X = sprintf('Img is RGB');
        disp(X);
        src = rgb2gray(src);
    end

    dst = edge(src, f, threshold);
    figure, imshow(dst);
    imwrite(dst, dst_path);
end

function dst = detect_edges_nothinning(src, dst_path)
    if numel(size(src))>=3
        X = sprintf('Img is RGB');
        disp(X);
        src = rgb2gray(src);
    end

    dst = edge(src, 'nothinning');
    figure, imshow(dst);
    imwrite(dst, dst_path);
end


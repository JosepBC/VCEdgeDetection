d95 = imread('../in_img/Imatges_contorns/d95.bmp');

% 3.1 3x3 filter
d95_mean_3 = mean_filter(d95, 3);
detect_edges(d95_mean_3, '../out_img/ex3/d95_mean_3x3.bmp');

d95_gaussian_3 = gaussian_filter(d95, 3);
detect_edges(d95_gaussian_3, '../out_img/ex3/d95_gaussian_3x3.bmp');

% 3.2 7x7 and 11x11 filters
d95_mean_7 = mean_filter(d95, 7);
detect_edges(d95_mean_7, '../out_img/ex3/d95_mean_7x7.bmp');

d95_gaussian_7 = gaussian_filter(d95, 7);
detect_edges(d95_gaussian_7, '../out_img/ex3/d95_gaussian_7x7.bmp');


d95_mean_11 = mean_filter(d95, 11);
detect_edges(d95_mean_11, '../out_img/ex3/d95_mean_11x11.bmp');

d95_gaussian_11 = gaussian_filter(d95, 11);
detect_edges(d95_gaussian_11, '../out_img/ex3/d95_gaussian_11x11.bmp');

function dst = detect_edges(src, dst_path)
    if numel(size(src))>=3
        X = sprintf('Img is RGB');
        disp(X);
        src = rgb2gray(src);
    end

    x_kernel = [-1 0 1; -2 0 2; -1 0 1];
    y_kernel = [-1 -2 -1; 0 0 0; 1 2 1];
    
    x_gradient = conv2(src, x_kernel);
    y_gradient = conv2(src, y_kernel);

    dst = abs(x_gradient) + abs(y_gradient);
    imwrite(dst, dst_path);
end

function dst = mean_filter(src, size)
    dst = medfilt2(src, [size, size]);
    %figure, imshow(dst);
    %title(size)
end

function dst = gaussian_filter(src, window_size)
    dst = imgaussfilt(src, "FilterSize", window_size);
    %figure, imshow(dst);
    %title(window_size)
end
d95a2 = imread('../in_img/Imatges_contorns/d95a2.bmp');
camisas_bn = imread('../in_img/Imatges_contorns/camisas_bn.bmp');
d95 = imread('../in_img/Imatges_contorns/d95.bmp');
frase_bn = imread('../in_img/Imatges_contorns/frase_bn.bmp');

detect_edges(d95a2, '../out_img/ex2/d95a2_edges.bmp');

detect_edges(camisas_bn, '../out_img/ex2/camisasbn_edges.bmp');

detect_edges(d95, '../out_img/ex2/d95_edges.bmp');

detect_edges(frase_bn, '../out_img/ex2/frase_edges.bmp');

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
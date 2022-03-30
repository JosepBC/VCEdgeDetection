d95a2 = imread('../in_img/Imatges_contorns/d95a2.bmp');
camisas_bn = imread('../in_img/Imatges_contorns/camisas_bn.bmp');
d95 = imread('../in_img/Imatges_contorns/d95.bmp');
frase_bn = imread('../in_img/Imatges_contorns/frase_bn.bmp');

figure, imshow(d95a2);
d95a2_edges = detect_edges(d95a2);
figure, imshow(d95a2_edges);

%figure, imshow(camisas_bn);
%camisas_bn_edges = detect_edges(camisas_bn);
%figure, imshow(camisas_bn_edges);

%figure, imshow(d95);
%d95_edges = detect_edges(d95);
%figure, imshow(d95_edges);

%figure, imshow(frase_bn);
%frase_bn_edges = detect_edges(frase_bn);
%figure, imshow(frase_bn_edges);

function dst = detect_edges(src)
    if numel(size(src))>=3
        X = sprintf('Img is RGB');
        disp(X);
        src = rgb2gray(src);
    end

    x_kernel = [-1 0 1;-2 0 2; -1 0 1];
    y_kernel = [-1 -2 -1; 0 0 0; 1 2 1];
    
    x_gradient = conv2(src, x_kernel);
    y_gradient = conv2(src, y_kernel);

    dst = abs(x_gradient) + abs(y_gradient);
end
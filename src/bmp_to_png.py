from PIL import Image
import glob
import os

out_dir = ''
for img in glob.glob('*.bmp'):
    Image.open(img).resize((300,300)).save(os.path.join(out_dir, img.split(".")[0] + '.png'))
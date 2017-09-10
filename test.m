%Konvertujemo sliku u grayscale zato sto ovaj program radi samo sa
%takvim slikama zbog jednostavnosti i vremena izvrsavanje
I = imread('slikaBoja.png');
I = rgb2gray(I);
imwrite(I,'slika.png');

r = 4; %broj senki potrebnih za rekonstukciju slike
n = 10; %broj senki koje ce program generisati
key = Shamir('slika.png', r, n); %poziv funkcije za generisanje senki

%----------------------------------------------------------------------
%deo programa za rekonstukciju slike

%niz naziva r slika 
B = {'1slika.png', '4slika.png', '2slika.png', '8slika.png'};
%niz rednih brojeva r slika
val = [1 4 2 8];

%poziv funkcije za rekonstukciju slike
%key je kljuc za permutovanje
img = reconstruct(B, val, key);

%prikaz rekonstruisane slike
imwrite(img, 'generated.png');
imshow(img);
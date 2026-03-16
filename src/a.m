% Définition de la fréquence d'échantillonnage (en Hz)
Fs=1000;

% Calcul de la période d'échantillonnage (en secondes)
Ts=1/Fs;

% Création du vecteur temps : de 0 à 1 seconde avec un pas de Ts
t=0:Ts:1-Ts;

% Définition de la fréquence du signal à générer (en Hz)
f=100;

% Génération d'un signal sinusoïdal d'amplitude 1, de fréquence f
x=sin(2*pi*f*t);

% Création du premier sous-graphique (2 lignes, 1 colonne, position 1)
subplot(2,1,1);

% Tracé du signal temporel en rouge
plot(t,x,'r');

% Calcul de la transformée de Fourier rapide (FFT) avec 512 points
xf=fft(x,512);

% Création du deuxième sous-graphique (2 lignes, 1 colonne, position 2)
subplot(2,1,2);

% Tracé du module (amplitude) du spectre fréquentiel
plot(abs(xf));
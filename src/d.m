% Définition de la fréquence d'échantillonnage (en Hz)
Fs = 1000;

% Calcul de la période d'échantillonnage (en secondes)
Ts = 1/Fs;

% Création du vecteur temps : de 0 à 1 seconde avec un pas de Ts
t = 0:Ts:1-Ts;

% Définition de la fréquence du signal à générer (en Hz)
f = 100;

% Nombre de points FFT
N = 512;

% Génération des signaux avec déphasages différents
Y1 = sin(2*pi*f*t + pi/2);        % Déphasage de +π/2 (cosinus)
Y2 = sin(2*pi*f*t + 3*pi/2);      % Déphasage de +3π/2

% Calcul de la FFT pour chaque signal
Y1f = fft(Y1, N);
Y2f = fft(Y2, N);

% Création de l'axe des fréquences (en Hz)
freq = (0:N-1) * Fs / N;

% Création d'une nouvelle figure
figure;

% Spectre de Y1
subplot(2, 1, 1);
plot(freq, abs(Y1f), 'b');
xlabel('Fréquence (Hz)');
ylabel('Amplitude');
title('Spectre de Y1 = sin(2\pift + \pi/2)');
grid on;
xlim([0 Fs/2]);  % Limiter à [0, Fs/2]

% Spectre de Y2
subplot(2, 1, 2);
plot(freq, abs(Y2f), 'r');
xlabel('Fréquence (Hz)');
ylabel('Amplitude');
title('Spectre de Y2 = sin(2\pift + 3\pi/2)');
grid on;
xlim([0 Fs/2]);  % Limiter à [0, Fs/2]
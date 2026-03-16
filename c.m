% Définition de la fréquence d'échantillonnage (en Hz)
Fs = 1000;

% Calcul de la période d'échantillonnage (en secondes)
Ts = 1/Fs;

% Création du vecteur temps : de 0 à 1 seconde avec un pas de Ts
t = 0:Ts:1-Ts;

% Définition de la fréquence du signal à générer (en Hz)
f = 100;

% Génération d'un signal sinusoïdal d'amplitude 1, de fréquence f
x = sin(2*pi*f*t);

% Différents nombres de points FFT à tester (en puissance de 2)
N_values = [128, 256, 512, 1024, 2048];

% Création d'une nouvelle figure
figure;

% Boucle pour tester chaque nombre de points FFT
for i = 1:length(N_values)
    N = N_values(i);
    
    % Calcul de la transformée de Fourier rapide (FFT) avec N points
    xf = fft(x, N);
    
    % Création de l'axe des fréquences (en Hz)
    freq = (0:N-1) * Fs / N;
    
    % Création du sous-graphique (5 lignes, 1 colonne, position i)
    subplot(5, 1, i);
    
    % Tracé du module (amplitude) du spectre en fonction de la fréquence
    plot(freq, abs(xf));
    
    % Ajout de labels et titre
    xlabel('Fréquence (Hz)');
    ylabel('Amplitude');
    title(sprintf('Spectre avec N = %d points FFT', N));
    grid on;
    
    % Limiter l'axe X pour une meilleure visualisation (0 à Fs/2)
    xlim([0 Fs/2]);
end
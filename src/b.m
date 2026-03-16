% Définition de la fréquence du signal à générer (en Hz)
f=100;

% Différentes fréquences d'échantillonnage à tester
Fs_values = [1000, 500, 300, 250, 200];

% Nombre de points pour la FFT
N = 512;

% Création d'une nouvelle figure
figure;

% Boucle pour tester chaque fréquence d'échantillonnage
for i = 1:length(Fs_values)
    Fs = Fs_values(i);
    
    % Calcul de la période d'échantillonnage (en secondes)
    Ts = 1/Fs;
    
    % Création du vecteur temps : de 0 à 1 seconde avec un pas de Ts
    t = 0:Ts:1-Ts;
    
    % Génération d'un signal sinusoïdal d'amplitude 1, de fréquence f
    x = sin(2*pi*f*t);
    
    % Calcul de la transformée de Fourier rapide (FFT)
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
    title(sprintf('Spectre avec Fs = %d Hz', Fs));
    grid on;

    % Limiter l'axe X pour une meilleure visualisation (0 à Fs/2)
    xlim([0 Fs/2]);
end
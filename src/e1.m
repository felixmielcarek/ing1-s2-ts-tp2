% Fréquences des 3 signaux (en Hz)
f1 = 10;
f2 = 500;
f3 = 1000;

% Détermination de la fréquence d'échantillonnage adaptée
fmax = max([f1, f2, f3]);  % fmax = 1000 Hz
Fs_min = 2 * fmax;          % Fs_min = 2000 Hz

% Choix d'une fréquence d'échantillonnage avec marge de sécurité
% On prend 5 fois la fréquence maximale pour avoir une excellente qualité
Fs = 5 * fmax;              % Fs = 5000 Hz
fprintf('Fréquence maximale du signal : %d Hz\n', fmax);
fprintf('Fréquence de Nyquist minimale : %d Hz\n', Fs_min);
fprintf('Fréquence d''échantillonnage choisie : %d Hz\n\n', Fs);

% Calcul de la période d'échantillonnage (en secondes)
Ts = 1/Fs;

% Création du vecteur temps : de 0 à 1 seconde
t = 0:Ts:1-Ts;

% Choix du nombre de points FFT (puissance de 2)
N = 2048;
fprintf('Nombre de points FFT : %d\n', N);
fprintf('Résolution fréquentielle : Δf = Fs/N = %.2f Hz\n\n', Fs/N);

% Génération des 3 signaux sinusoïdaux d'amplitude 1
S1 = sin(2*pi*f1*t);  % Signal à 10 Hz
S2 = sin(2*pi*f2*t);  % Signal à 500 Hz
S3 = sin(2*pi*f3*t);  % Signal à 1000 Hz

% Calcul de la somme des 3 signaux
S_total = S1 + S2 + S3;

% Calcul de la FFT de la somme
S_total_fft = fft(S_total, N);

% Création de l'axe des fréquences (en Hz)
freq = (0:N-1) * Fs / N;

% AFFICHAGE

figure;

% Signal temporel de la somme (zoom sur les premières millisecondes)
subplot(2, 1, 1);
plot(t, S_total, 'b', 'LineWidth', 1.5);
xlabel('Temps (s)');
ylabel('Amplitude');
title('Signal temporel : S(t) = sin(2\pi×10t) + sin(2\pi×500t) + sin(2\pi×1000t)');
grid on;
xlim([0 0.1]);  % Afficher les 100 premières millisecondes
ylim([-3.5 3.5]);

% Spectre d'amplitude de la somme
subplot(2, 1, 2);
plot(freq, abs(S_total_fft), 'b', 'LineWidth', 1.5);
xlabel('Fréquence (Hz)');
ylabel('Amplitude');
title('Spectre d''amplitude de la somme des 3 signaux');
grid on;
xlim([0 Fs/2]);  % Limiter à [0, Fs/2] = [0, 2500 Hz]

% Annotation des pics principaux
hold on;
% Marquer les fréquences des 3 signaux
plot([f1 f1], [0 max(abs(S_total_fft))], 'r--', 'LineWidth', 1);
plot([f2 f2], [0 max(abs(S_total_fft))], 'r--', 'LineWidth', 1);
plot([f3 f3], [0 max(abs(S_total_fft))], 'r--', 'LineWidth', 1);
text(f1, max(abs(S_total_fft))*0.9, sprintf('  %d Hz', f1), 'Color', 'r', 'FontWeight', 'bold');
text(f2, max(abs(S_total_fft))*0.9, sprintf('  %d Hz', f2), 'Color', 'r', 'FontWeight', 'bold');
text(f3, max(abs(S_total_fft))*0.9, sprintf('  %d Hz', f3), 'Color', 'r', 'FontWeight', 'bold');
hold off;

% Parameters
R = 10e3; % Resistance in Ohms
C = 100e-9; % Capacitance in Farads
A = 29; % Amplifier gain

% Time parameters
fs = 1e6; % Sampling frequency in Hz
t = 0:1/fs:1e-3; % Time vector (1 ms duration)

% Initial conditions
Vout = 1; % Initial output voltage
Vrc = zeros(1, 3); % Initial voltages across each RC stage

% State vectors
Vout_vec = zeros(size(t));
Vrc_vec = zeros(length(t), 3);

% Simulation loop
for i = 2:length(t)
    % Update voltages
    Vrc(1) = (Vout + Vrc(1) * (1 - 3*R*C*fs)) / (1 + 3*R*C*fs);
    Vrc(2) = (Vrc(1) + Vrc(2) * (1 - 3*R*C*fs)) / (1 + 3*R*C*fs);
    Vrc(3) = (Vrc(2) + Vrc(3) * (1 - 3*R*C*fs)) / (1 + 3*R*C*fs);
    Vout = A * Vrc(3);

    % Store the results
    Vout_vec(i) = Vout;
    Vrc_vec(i, :) = Vrc;
end

% Plot the results
figure;
subplot(4, 1, 1);
plot(t, Vout_vec);
title('Output Voltage');
xlabel('Time (s)');
ylabel('Voltage (V)');

subplot(4, 1, 2);
plot(t, Vrc_vec(:, 1));
title('Voltage across RC Stage 1');
xlabel('Time (s)');
ylabel('Voltage (V)');

subplot(4, 1, 3);
plot(t, Vrc_vec(:, 2));
title('Voltage across RC Stage 2');
xlabel('Time (s)');
ylabel('Voltage (V)');

subplot(4, 1, 4);
plot(t, Vrc_vec(:, 3));
title('Voltage across RC Stage 3');
xlabel('Time (s)');
ylabel('Voltage (V)');

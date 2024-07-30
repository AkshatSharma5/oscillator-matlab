% colpitts_oscillator.m
% Simulate a Colpitts Oscillator using MATLAB

% Parameters
L = 10e-6; % Inductance in Henrys
C1 = 100e-12; % Capacitance in Farads
C2 = 100e-12; % Capacitance in Farads
R = 10; % Resistance in Ohms

% Time parameters
fs = 1e6; % Sampling frequency in Hz
t = 0:1/fs:1e-3; % Time vector (1 ms duration)

% Differential equation coefficients
A = 1 / (L * (C1 + C2));
B = R / L;
C = 1 / (L * C1 * C2);

% Initial conditions
Vc1 = 1; % Initial voltage across C1
Vc2 = 0; % Initial voltage across C2
Il = 0; % Initial current through L

% State vectors
Vc1_vec = zeros(size(t));
Vc2_vec = zeros(size(t));
Il_vec = zeros(size(t));

% Simulation loop
for i = 2:length(t)
    % Update current and voltages
    dIl = (Vc1 - Vc2) / L;
    dVc1 = (Il - Vc1 / (R * C1)) / C1;
    dVc2 = (Il - Vc2 / (R * C2)) / C2;

    % Euler method for integration
    Il = Il + dIl * (t(i) - t(i-1));
    Vc1 = Vc1 + dVc1 * (t(i) - t(i-1));
    Vc2 = Vc2 + dVc2 * (t(i) - t(i-1));

    % Store the results
    Vc1_vec(i) = Vc1;
    Vc2_vec(i) = Vc2;
    Il_vec(i) = Il;
end

% Plot the results
figure;
subplot(3, 1, 1);
plot(t, Vc1_vec);
title('Voltage across C1');
xlabel('Time (s)');
ylabel('Voltage (V)');

subplot(3, 1, 2);
plot(t, Vc2_vec);
title('Voltage across C2');
xlabel('Time (s)');
ylabel('Voltage (V)');

subplot(3, 1, 3);
plot(t, Il_vec);
title('Current through L');
xlabel('Time (s)');
ylabel('Current (A)');

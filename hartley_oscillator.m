% hartley_oscillator.m
% Simulate a Hartley Oscillator using MATLAB

% Parameters
L1 = 10e-6; % Inductance 1 in Henrys
L2 = 10e-6; % Inductance 2 in Henrys
C = 100e-12; % Capacitance in Farads
R = 10; % Resistance in Ohms

% Time parameters
fs = 1e6; % Sampling frequency in Hz
t = 0:1/fs:1e-3; % Time vector (1 ms duration)

% Differential equation coefficients
A = 1 / ((L1 + L2) * C);
B = R / (L1 + L2);

% Initial conditions
Vc = 1; % Initial voltage across C
Il = 0; % Initial current through L1 and L2

% State vectors
Vc_vec = zeros(size(t));
Il_vec = zeros(size(t));

% Simulation loop
for i = 2:length(t)
    % Update current and voltages
    dIl = Vc / (L1 + L2);
    dVc = Il / C - Vc / (R * C);

    % Euler method for integration
    Il = Il + dIl * (t(i) - t(i-1));
    Vc = Vc + dVc * (t(i) - t(i-1));

    % Store the results
    Vc_vec(i) = Vc;
    Il_vec(i) = Il;
end

% Plot the results
figure;
subplot(2, 1, 1);
plot(t, Vc_vec);
title('Voltage across C');
xlabel('Time (s)');
ylabel('Voltage (V)');

subplot(2, 1, 2);
plot(t, Il_vec);
title('Current through L');
xlabel('Time (s)');
ylabel('Current (A)');

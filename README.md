# Oscillators Simulation in MATLAB

This project simulates various types of oscillators using MATLAB, including the Colpitts oscillator, Hartley oscillator, and RC phase shift oscillator. Each oscillator is implemented in a separate MATLAB script, providing detailed analysis and visualization of their behavior.

## Table of Contents

- [Introduction](#introduction)
- [Oscillators](#oscillators)
  - [Colpitts Oscillator](#colpitts-oscillator)
  - [Hartley Oscillator](#hartley-oscillator)
  - [RC Phase Shift Oscillator](#rc-phase-shift-oscillator)

## Introduction

Oscillators are fundamental components in electronic circuits, generating periodic waveforms without an external input signal. This project simulates several types of oscillators in MATLAB, allowing you to study their behavior and analyze their output waveforms.

## Oscillators

### Colpitts Oscillator

The Colpitts oscillator is an LC oscillator that uses a combination of inductors and capacitors to produce high-frequency oscillations.

#### MATLAB Script: `colpitts_oscillator.m`

- **Parameters:**
  - Inductance (L)
  - Capacitance (C1, C2)
  - Resistance (R)
- **Output:**
  - Voltage across C1
  - Voltage across C2
  - Current through L

### Hartley Oscillator

The Hartley oscillator is another type of LC oscillator that uses inductors and a capacitor to generate oscillations.

#### MATLAB Script: `hartley_oscillator.m`

- **Parameters:**
  - Inductance (L1, L2)
  - Capacitance (C)
  - Resistance (R)
- **Output:**
  - Voltage across C
  - Current through L1 and L2

### RC Phase Shift Oscillator

The RC phase shift oscillator uses resistors and capacitors to produce a phase shift, resulting in oscillations.

#### MATLAB Script: `rc_phase_shift_oscillator.m`

- **Parameters:**
  - Resistance (R)
  - Capacitance (C)
  - Amplifier gain (A)
- **Output:**
  - Output voltage
  - Voltage across each RC stage

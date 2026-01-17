## 1. Project Overview
This project involves the design, simulation, and hardware prototyping of a 3-band active graphic equalizer. The system is designed to operate on a single 5V supply, providing independent control over Bass (100Hz), Mid (1kHz), and Treble (4kHz) frequencies while maintaining a unified 0dB (Unity Gain) peak response across all bands.

<img width="1919" height="850" alt="image" src="https://github.com/user-attachments/assets/419de428-ff1b-40a5-8657-e9c3d650582c" />


## 2. Key Engineering Features

**Dual Supply Operation (±5 V)**
  
  The circuit was powered using a ±5 V DC supply, allowing true bipolar signal swing without the need for virtual ground biasing.

- **Rail-to-Rail (R2R) Performance**
  
  R2R op-amps were selected to maximize dynamic range and prevent clipping near supply rails.


- **Active MFB Topology**
  
  Multiple Feedback filters chosen for stability and independent control over gain and Q-factor.

---

## 3. Design Specifications

### A. Frequency & Q-Factor Selection
Filters were engineered with 
**Q ≈ 1.6**
 to achieve a Butterworth-like musical response.

**Reasoning**

- Higher Q → unwanted resonance and ringing  
- Lower Q → poor band selectivity  
- Q ≈ 1.6 → smooth transition between bands

| Band   | Center Frequency | Capacitor | Audio Role |
|-------|-----------------|-----------|------------|
| Bass  | 100 Hz          | 10 nF    | Low-end thump and rhythm |
| Mid   | 1 kHz           | 10 nF     | Vocal clarity |
| Treble| 4 kHz           | 10 nF     | Brightness and transients |

## 4. Hardware Selection: Rail-to-Rail Advantage

Operating on a 5V supply allows only 2.5V swing around the bias point.

- **Standard op-amps:**
 clip near ~3.5V → loss of ~30% headroom  
- **R2R op-amps:**
 enable near full 5Vpp swing  

This was critical in the 
**summing amplifier**
, where overlapping peaks from multiple bands can create additive voltage spikes.

## 5. Performance Verification

### Simulation (LTspice)

- Summing amplifier feedback resistor set to 
**1.3 kΩ**
  
- Neutralized the 11 dB gain from MFB stages  
- Achieved 
**flat unity-gain response**
 at band peaks

![WhatsApp Image 2026-01-09 at 22 22 50](https://github.com/user-attachments/assets/e6f28476-f1bc-453e-9f8a-1c348d13d16e)


## 4. Test Setup and Hardware Environment


**Equipment Used**

- DC generator providing 
**+5 V / −5 V dual supply**

- Function generator as audio input source  
- Oscilloscope for amplitude and phase measurement

**Measurement Approach**

- Input sine waves at 100 Hz, 1 kHz, and 4 kHz  
- Observed individual band responses  
- Verified summed output amplitude and phase  
- Checked for clipping and distortion at higher levels

# Hardware Measurements : 
![WhatsApp Image 2026-01-17 at 12 19 50](https://github.com/user-attachments/assets/5b3086cb-d606-4c36-9f2c-54383cd7b83e)
<img width="878" height="641" alt="image" src="https://github.com/user-attachments/assets/87326797-1d01-42d3-a358-3709bdea8f24" />
<img width="879" height="688" alt="image" src="https://github.com/user-attachments/assets/c6f151f5-2efb-45b5-a7f6-a453fb3a5b69" />
- Alice Band Pass Result
  <img width="785" height="448" alt="image" src="https://github.com/user-attachments/assets/ac7574a0-043e-4c57-b931-295def5eba37" />

### Simulation (LTspice)

- Summing amplifier feedback resistor set to 
**1.5 kΩ**
  
- Neutralized the 11 dB gain from MFB stages  
- Achieved flat unity-gain response at band centers

### Hardware Results

- **Input:**
 1.00 Vpp from function generator  
- **Output:**
 1.03 Vpp at 1 kHz  
- **Gain Error:**
 <3% (near 0 dB target)  
- **Phase:**
 180° inversion as expected for inverting summer

# Audio Validation Using MATLAB & ALICE CSV Workflow

To test the equalizer with real audio content, I used a CSV-based signal chain instead of playing audio directly from the laptop:

- An audio file was sampled in MATLAB and converted into CSV amplitude samples
- These samples were imported into ALICE software and sent to the hardware input
- The equalizer output was captured again in ALICE as CSV data
- The captured CSV was converted back to an audio file in MATLAB for listening and comparison
  
This approach allowed verification with real complex signals rather than only sine waves, and helped observe how bass, mid, and treble shaping affected actual audio content after full hardware processing.

## Conclusion


The project demonstrates complete analog system design from filter synthesis to real hardware validation. Using a 
**±5 V dual supply with function generator and oscilloscope**
, the equalizer achieved accurate band separation and near-unity output, validating the design choices and calibration strategy





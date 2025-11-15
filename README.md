# Keyed XOR Cipher

Lightweight Verilog implementation of a keyed XOR stream cipher with an LFSR-based keystream generator, a synthesizable XOR cipher unit, and a testbench for functional verification.

Why this project

- Demonstrates RTL design and verification workflow for a simple stream cipher.
- Useful for learning Verilog, LFSRs, testbench-driven verification, and simulation automation.
- Small, self-contained, and easy to reuse as a teaching example or homework/portfolio piece.

Repository layout

- `src/` - Verilog sources (keystream_lfsr.v, xor_cipher.v, xor_unit.v)
- `tb/` - Testbench(s) (`tb_xor_cipher.v`)
- `sim/` - Simulation outputs and traces (VCD files)
- `docs/` - Project report and notes (`report.txt`)
- `run_sim.py` - Convenience script to run the simulation locally

Highlights (good for a resume)

- Implemented a keyed XOR stream cipher in synthesizable Verilog with an LFSR keystream generator and modular XOR unit.
- Built a fully automated simulation flow and self-checking testbench to validate correctness.
- Added CI to compile and smoke-test the Verilog sources with Icarus Verilog.

Quick start (local)

Prerequisites:
- Git
- Icarus Verilog (`iverilog`) to compile and run the testbench (optional but recommended)

Run simulation locally (example using Icarus Verilog):

```cmd
cd "C:\Users\Meenu Dua\Documents\Keyed_XOR_Cipher_(3)[1]\Keyed_XOR_Cipher\Keyed_XOR_Cipher"
iverilog -o sim/xor_tb_out tb/tb_xor_cipher.v src/*.v
vvp sim/xor_tb_out
```

The testbench will generate a VCD under `sim/` (if enabled) which you can open in a waveform viewer.

CI / GitHub Actions

This repo includes a minimal GitHub Actions workflow that installs Icarus Verilog and attempts to compile the testbench. The workflow is primarily a smoke test to ensure the sources remain buildable.

Recommended next steps

- Add a LICENSE (this repo contains one; change it if you prefer a different license).
- Add more test vectors and edge-case tests (e.g., varying key length, reset conditions).
- Add a README screenshot or waveform snippet to show sample output.

Contact / attribution

If you use this in a portfolio or class, attribute the original work and include a short summary such as the bullets in `resume_bullets.txt`.

--
Repository prepared for GitHub and resume inclusion.

--
Generated/updated by assistant to prepare project for GitHub push.

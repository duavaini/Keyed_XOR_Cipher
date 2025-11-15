import os
import subprocess

# --- Folders ---
SRC_DIR = "src"
TB_DIR = "tb"
SIM_DIR = "sim"

# --- Files ---
TB_FILE = f"{TB_DIR}/tb_xor_cipher.v"

# adds all files that need to be compiled
MODULES = [
    f"{SRC_DIR}/xor_unit.v",
    f"{SRC_DIR}/keystream_lfsr.v",
    f"{SRC_DIR}/xor_cipher.v",
    TB_FILE
]

def ensure_dirs():
    """Ensure sim/ exists"""
    #it checks if the sim directory exists
    if not os.path.exists(SIM_DIR):
        os.makedirs(SIM_DIR)
        print("📁 Created sim/ directory")

def add_test_case():
    # func to add tests casessss
    key = input("Enter 8-bit key in hex (e.g., B3): ").strip() #takes key
    pt = input("Enter 8-bit plaintext in hex (e.g., 4F): ").strip() # takes plain text
    new_line = f"        run_test(8'h{key.upper()}, 8'h{pt.upper()}); // added from terminal\n"

    with open(TB_FILE, "r") as f:
        lines = f.readlines()

    start = None
    end = None
    #loops through the lines of the testbench to find the added marker comments ie the test cases begin and test cases end line in the code
    for i, line in enumerate(lines):
        if "// << TEST CASES BEGIN >>" in line:
            start = i
        if "// << TEST CASES END >>" in line:
            end = i

    if start is None or end is None:
        print("❌ Could not find marker lines in testbench.") #if both indices are none then the marker lines are not found
        return

    # Insert the test case line before the test case end marker
    lines.insert(end, new_line)

    with open(TB_FILE, "w") as f:
        f.writelines(lines)

    print(f"✅ Added new test: key={key}, plaintext={pt}") # shows the confirmation of added test cases

def run_sim():
    ensure_dirs() #makes sure the dir exists
    print("\n🔧 Compiling and running simulation...\n")
    cmd = ["iverilog", "-o", f"{SIM_DIR}/xor_cipher_sim"] + MODULES #builds the command needed to run the code 
    subprocess.run(cmd, check=True)
    subprocess.run(["vvp", f"{SIM_DIR}/xor_cipher_sim"], check=True)

def main():
    while True:
        print("\n XOR Cipher Test Manager ")
        print("1. Run Simulation")
        print("2. Add New Test Case")
        print("3. Exit")

        choiceeee = input("Choose option: ").strip()
        if choiceeee == "1":
            run_sim()
        elif choiceeee == "2":
            add_test_case()
        elif choiceeee == "3":
            break
        else:
            print("Invalid choicee.")

if __name__ == "__main__":
    main()

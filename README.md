Keyed XOR Cipher

A simple Python implementation of a Keyed XOR Cipher for encrypting and decrypting text using a custom key.

Features

1)Encrypt & decrypt text
2)Repeating-key XOR logic
3)Easy-to-read Python code

Works on strings and files

How to Use:
Run Encryption:-python3 encrypt.py

Run Decryption:-python3 decrypt.py

How It Works
->The cipher performs XOR between each byte of the text and each byte of the key (key repeats automatically):

cipher = text ⊕ key
text   = cipher ⊕ key

Project Structure
xor_cipher.py     # Core XOR cipher class
encrypt.py        # Encrypt text
decrypt.py        # Decrypt text
examples/         # Sample inputs/outputs

Thank you!
Note

This cipher is for learning purposes only and not meant for secure real-world encryption.

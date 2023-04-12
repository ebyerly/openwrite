python3 -m pip install --user qmk
qmk setup
qmk new-keyboard
# name: kb2040_2x2_test
# attribution: ebyerly
# more attribution: ebyerly
# base layout: 28 / ortho_2x3
# what powers your project: 10 / kb2040

# Output:
# Ψ Created a new keyboard called kb2040_2x2_test.
# Ψ To start working on things, `cd` into keyboards/kb2040_2x2_test,
# Ψ or open the directory in your preferred text editor.
# Ψ And build with qmk compile -kb kb2040_2x2_test -km default.

# Does QMK care where it lives? Can I move these directories around?
ls ~/qmk_firmware/keyboards/kb2040_2x2_test
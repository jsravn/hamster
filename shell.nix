let
  pkgs = import <nixpkgs> {};
in
pkgs.mkShell {
  buildInputs = with pkgs; [
    ansible_2_8
    wireguard
    qrencode
  ];
}

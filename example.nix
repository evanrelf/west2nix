let
  pkgs = import <nixpkgs> { };

  west2nix = pkgs.callPackage ./default.nix { };

  zephyr =
    pkgs.fetchFromGitHub {
      owner = "zmkfirmware";
      repo = "zephyr";
      rev = "f2108f1646b964adffb9c7ed74641c828fef2a44";
      hash = "sha256-jEy+4OdBieu1HnSFpd/aJoFBDI1cTwiyqaXuNesHg4w=";
    };

in
west2nix "${zephyr}/west.yml" {
  hashes = {
    "canopennode" = "sha256-vXPtAQqVj0nQdhaFiPVg7AIIFypa8p9GAOW9m6anr5U=";
    "ci-tools" = "sha256-YclADJjv0n3qdgP5dyfIn+QOl7HxQ46iFDtj8e4jAaA=";
    "civetweb" = "sha256-M7T3m8xeFME3pAYJa87cF/xqRBZP5wLg8CLtWI8zU4g=";
    "cmsis" = "sha256-SZbopDEcf/Ye6OkrCvC4gn+G0u2MPn1d0RdxzBy9Hj8=";
    "edtt" = "sha256-hlA2nJOak/LNPDOjgTqqQmXCSnazR/F4DYgLe2sq+Kw=";
    "fatfs" = "sha256-+Odgcwm7d7ZWUIr3WPXYD/NadZCJnmwKOmifFs9iXEQ=";
    "hal_altera" = "sha256-5XcbF44Ed2cQ7dZGgBbTbINzUSMTcYjnH2SHQstK9ys=";
    "hal_atmel" = "sha256-A9ry772WJuH95Le1GV447/2oA+3E5Pu4VnVLlgDFUuE=";
    "hal_cypress" = "sha256-tvjeG8Bc8kJFGLcd7LGt/zXEvXiJw1x++MkW7qqCh/4=";
    "hal_espressif" = "sha256-A0f4+y1CLiofkTtlrMiuCzuPioJ913yrpJYwpKHx1ys=";
    "hal_infineon" = "sha256-dkgKv5szXTyIZa6X2v9s5cAYcGlZ5RS90lnk8jq3D4Y=";
    "hal_microchip" = "sha256-i85RH66YNTxwX1iVGUed29PxgvbQrkK8G72G+P0AJBI=";
    "hal_nordic" = "sha256-i0kIgDO7D5E9/3+CpZ5T8INjSv5+JD4+eKg5E6OZaRY=";
    "hal_nuvoton" = "sha256-vp4G1qKfVVxEUJgD0lBy9fO3SNcJ8rnRQcS4fW1UgiQ=";
    "hal_nxp" = "sha256-tyIfG7z6I/k4g7LbVVnBB4xwZC6Mw8iAv1Tb37vZNls=";
    "hal_openisa" = "sha256-ZxAgqVvYFBGl+VFigP9+4MRtf15wXEfvLZxOJNg1a88=";
    "hal_quicklogic" = "sha256-XpPROaiZN0KRxQCtEOYaXSEBtxAo+atnH1ytOMXpYUI=";
    "hal_silabs" = "sha256-Lz7nhMikkhC1BbolM76tZ/UzcFa8Qiqsf90Cb6aiBNU=";
    "hal_st" = "sha256-bsqmvxIj/IUUUF4DQxrafBFImeStMK7xI2wtAdMzv1c=";
    "hal_stm32" = "sha256-T05icRoiWo4hGhAYvZl4gkd/zvcgSyVwCfx2u7nXrEQ=";
    "hal_ti" = "sha256-KIMykuLJDWJGlhOU4U5KDWOMiNQ4A7joOA4myEFdiaw=";
    "hal_xtensa" = "sha256-jxYu1T+2cwlPRa84KETjm3Uh5v8mc/Ds3brSCLhTQnE=";
    "libmetal" = "sha256-nbIJ578LNRgeVhbz4MeIOCmny23zQIOm6nUxO3yZr8g=";
    "litlefs" = "sha256-jxYu1T+2cwlPRa84KETjm3Uh5v8mc/Ds3brSCLhTQnE=";
    "littlefs" = "sha256-lN4z5whLmaLWpQiY1OPq3p7rBCWJZUO9Kv2R6g+O48A=";
    "loramac-node" = "sha256-bNrTRbmaJ4w5pA2MxqB7L8tmOIe0UxpO7aV3bb0+rTE=";
    "lvgl" = "sha256-kNkaEYP7Dfkoe65lgO47kaObklN2itEit1yLGhgkP0E=";
    "mbedtls" = "sha256-Q9sZxP/t5+WziZ/BtcZt59pS4CGr7o2PnPHUV2oCl5A=";
    "mcuboot" = "sha256-xVyjpTT0IReAVzE9Fm3x/j9uX64bYMUA/NccXCc0F6o=";
    "mcumgr" = "sha256-p8UyAF6lR6nRGBDIG5Wt3RgbZwe0OLVh6yshypjfUNo=";
    "mipi-sys-t" = "sha256-Qw5X3iit5rqqMuwous8iUQeoFq40HbXSTxhsmd/aFV0=";
    "net-tools" = "sha256-E6dIUjeRLOCHbL2iqynRri7jsXXK0wxcjfDgq97bOJo=";
    "nrf_hw_models" = "sha256-tDpst18bnjnTHNsB6KDYINYe0WJGry8lYBB2m2LZRQA=";
    "open-amp" = "sha256-ScbHD7IbqBacTP/YuCDPBvZrZLiTPXu0nVv2IN9HcSA=";
    "openthread" = "sha256-8cn1viDQvcBsZud0yuEWf5aYntFkIRYO5XttNg1mg+0=";
    "segger" = "sha256-NyHHGLvS7wFQ12T5CQX5VHOePdc/mJEwoiZk/VoPw1g=";
    "silabs" = "sha256-Lz7nhMikkhC1BbolM76tZ/UzcFa8Qiqsf90Cb6aiBNU=";
    "sof" = "sha256-Tu3PaI4WysO2Z6bqA7JCp32I68vi5MZxjsXB79DhAfU=";
    "tfm-mcuboot" = "sha256-zzNT2RJCuvU9Yk+iCSSEg0nBc7zZzDd5gsCo/tsIxeU=";
    "tinycbor" = "sha256-ro3xosn8OKfE86uTNaY5maRkR8ERCCyN6ZXL0jhtZK0=";
    "tinycrypt" = "sha256-5gtZbZNx+D/EUkyYk7rPtcxBZaNs4IFGTP/7IXzCoqU=";
    "trusted-firmware-m" = "sha256-8D4l5p8VriED3WWJLdY5IHcf2OO0ScrwFnmOqr27uxc=";
    "uf2" = "sha256-AFLOv/ZyZZqWwJtSz3OfoBWswNvC/eUU82jf4XFow0c=";
    "zephyr" = "sha256-jEy+4OdBieu1HnSFpd/aJoFBDI1cTwiyqaXuNesHg4w=";
  };
}

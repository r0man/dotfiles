(cons* (channel
        (name 'flat)
        (url "https://github.com/flatwhatson/guix-channel.git")
        (commit "1a0f3f0ee9f4a2c20aa64ddad0aacd4b3e3e6c80")
        (introduction
         (make-channel-introduction
          "33f86a4b48205c0dc19d7c036c85393f0766f806"
          (openpgp-fingerprint
           "736A C00E 1254 378B A982  7AF6 9DBE 8265 81B6 4490"))))
       (channel
        (name 'nonguix)
        (url "https://gitlab.com/nonguix/nonguix")
        (introduction
         (make-channel-introduction
          "897c1a470da759236cc11798f4e0a5f7d4d59fbc"
          (openpgp-fingerprint
           "2A39 3FFF 68F4 EF7A 3D29  12AF 6F51 20A0 22FB B2D5"))))
       (channel
        (name 'r0man)
        (url "https://github.com/r0man/guix-channel.git")
        (branch "main")
        (introduction
         (make-channel-introduction
          "8eb7a76af9b51b80f5c01f18639e6360833fc377"
          (openpgp-fingerprint
           "D226 A339 D8DF 4481 5DDE  0CA0 3DDA 5252 7D2A C199"))))
       %default-channels)

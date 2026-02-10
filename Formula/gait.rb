class Gait < Formula
  desc "Offline-first control plane for production AI agent tool calls"
  homepage "https://github.com/davidahmann/gait"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/davidahmann/gait/releases/download/v1.0.1-rc4/gait_1.0.1-rc4_darwin_arm64.tar.gz"
      sha256 "8bc81c5ddaa15af078c64d4836c3cc38f846a8e40c7da57a7fefeb96deafcca5"
    else
      url "https://github.com/davidahmann/gait/releases/download/v1.0.1-rc4/gait_1.0.1-rc4_darwin_amd64.tar.gz"
      sha256 "b4f22830dc396a91a7ef0334c9ed7dfaee2adcd6990f40817a6d9e68ef968c0c"
    end
  end

  def install
    bin.install "gait"
  end

  test do
    output = shell_output("#{bin}/gait demo --json")
    assert_match "\"run_id\"", output
  end
end

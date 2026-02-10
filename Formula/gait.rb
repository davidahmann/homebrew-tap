class Gait < Formula
  desc "Offline-first control plane for production AI agent tool calls"
  homepage "https://github.com/davidahmann/gait"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/davidahmann/gait/releases/download/v1.0.1-rc4/gait_1.0.1-rc4_darwin_arm64.tar.gz"
      sha256 "03b3f3e0c9589b61df6a0ae63035f56f182680fb5981bec439d173e399e7172f"
    else
      url "https://github.com/davidahmann/gait/releases/download/v1.0.1-rc4/gait_1.0.1-rc4_darwin_amd64.tar.gz"
      sha256 "97e28f61a776394fb4c5eeec533aab14fdd197b9b8a919088edb7fe826ecaa05"
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

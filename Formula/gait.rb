class Gait < Formula
  desc "Offline-first control plane for production AI agent tool calls"
  homepage "https://github.com/davidahmann/gait"
  version "1.1.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/davidahmann/gait/releases/download/v1.1.0/gait_1.1.0_darwin_arm64.tar.gz"
      sha256 "a8ccc69c4e27b6998da13adedcb5da8ab25b2bc2fb59a48c3fa7cc206007b244"
    else
      url "https://github.com/davidahmann/gait/releases/download/v1.1.0/gait_1.1.0_darwin_amd64.tar.gz"
      sha256 "c425f38e3c5d382a4f89a35c8f3d8faffe72e39b64febd4f6befdd6b7c78f190"
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

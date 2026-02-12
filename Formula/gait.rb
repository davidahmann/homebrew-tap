class Gait < Formula
  desc "Offline-first control plane for production AI agent tool calls"
  homepage "https://github.com/davidahmann/gait"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/davidahmann/gait/releases/download/v1.0.6/gait_1.0.6_darwin_arm64.tar.gz"
      sha256 "52cf23411baf6546fb8a051b36e2fd84d1a99ca4eed9cf33a7383f5713c539b1"
    else
      url "https://github.com/davidahmann/gait/releases/download/v1.0.6/gait_1.0.6_darwin_amd64.tar.gz"
      sha256 "f3ec3e4eb9eb1206bc1f11d706f031dc569f10cf56cd9f4efd44060387302e20"
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

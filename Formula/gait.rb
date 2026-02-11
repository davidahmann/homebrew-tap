class Gait < Formula
  desc "Offline-first control plane for production AI agent tool calls"
  homepage "https://github.com/davidahmann/gait"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/davidahmann/gait/releases/download/v1.0.4/gait_1.0.4_darwin_arm64.tar.gz"
      sha256 "26fa257a8845c78ffd41b1500054af0b520c75cbfbf9512092665d734a10ca09"
    else
      url "https://github.com/davidahmann/gait/releases/download/v1.0.4/gait_1.0.4_darwin_amd64.tar.gz"
      sha256 "e9a88cee72af3ab3b8a129c2668e250cee94f79b758456c6cf5a18401f99c985"
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

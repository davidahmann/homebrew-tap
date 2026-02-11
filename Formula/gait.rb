class Gait < Formula
  desc "Offline-first control plane for production AI agent tool calls"
  homepage "https://github.com/davidahmann/gait"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/davidahmann/gait/releases/download/v1.0.3/gait_1.0.3_darwin_arm64.tar.gz"
      sha256 "465fe3246c4598948983e3c066a413b63032defeb1dfd772b355e59ca6ecc3ec"
    else
      url "https://github.com/davidahmann/gait/releases/download/v1.0.3/gait_1.0.3_darwin_amd64.tar.gz"
      sha256 "1c4fa8dc91215847644fa343d4a5a9dd1bd5528eadcb1ae843963ca390ce0387"
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

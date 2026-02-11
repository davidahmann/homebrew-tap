class Gait < Formula
  desc "Offline-first control plane for production AI agent tool calls"
  homepage "https://github.com/davidahmann/gait"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/davidahmann/gait/releases/download/v1.0.5/gait_1.0.5_darwin_arm64.tar.gz"
      sha256 "29087276cbd7e89e8f05f23d7e804c35a6c58b2fdff4497605ebe9268e8f177f"
    else
      url "https://github.com/davidahmann/gait/releases/download/v1.0.5/gait_1.0.5_darwin_amd64.tar.gz"
      sha256 "2d8639ce0eab70f9eefe1e00b0b394b61347b9b695fa7054919a811a6c878316"
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

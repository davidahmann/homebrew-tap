class Gait < Formula
  desc "Offline-first control plane for production AI agent tool calls"
  homepage "https://github.com/davidahmann/gait"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/davidahmann/gait/releases/download/v1.0.8/gait_1.0.8_darwin_arm64.tar.gz"
      sha256 "9fed63055d6710d237eee6bf074ea95ce14be93b9f50cb182d7cd160cf138184"
    else
      url "https://github.com/davidahmann/gait/releases/download/v1.0.8/gait_1.0.8_darwin_amd64.tar.gz"
      sha256 "1d1ae7a00fb41d2bed081a92e1bdda5bb485df0b539e20ebc8e0abea022ad9b4"
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

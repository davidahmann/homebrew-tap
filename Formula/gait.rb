class Gait < Formula
  desc "Offline-first control plane for production AI agent tool calls"
  homepage "https://github.com/davidahmann/gait"
  version "1.2.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/davidahmann/gait/releases/download/v1.2.1/gait_1.2.1_darwin_arm64.tar.gz"
      sha256 "857751ea18424203bf4c05ff85e3bfe875ea4ff83b8e9262ed8ab935a9234095"
    else
      url "https://github.com/davidahmann/gait/releases/download/v1.2.1/gait_1.2.1_darwin_amd64.tar.gz"
      sha256 "5b3573fc70c782c5069ea0628f4af257d27549923dff3e159611a5fe2ab0ec2c"
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

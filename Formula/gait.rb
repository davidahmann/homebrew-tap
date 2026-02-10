class Gait < Formula
  desc "Offline-first control plane for production AI agent tool calls"
  homepage "https://github.com/davidahmann/gait"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/davidahmann/gait/releases/download/v1.0.2/gait_1.0.2_darwin_arm64.tar.gz"
      sha256 "3d5ac520b50ea5b93de0f5e9c10a041a6cb89250a7d30ed6409b780f13ca1e97"
    else
      url "https://github.com/davidahmann/gait/releases/download/v1.0.2/gait_1.0.2_darwin_amd64.tar.gz"
      sha256 "2378f8032df41be0b7213984f5658e1eeb4f1f9d0c6c7052e096f804f6652d70"
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

class Wrkr < Formula
  desc "Dispatch and supervision for long-running agent jobs"
  homepage "https://github.com/davidahmann/wrkr"
  version "1.0.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/davidahmann/wrkr/releases/download/v1.0.1/wrkr_1.0.1_darwin_arm64.tar.gz"
      sha256 "c16783d41383224ace98e4f113823a020f65565b5a56c4107c6f3a05899c6c1e"
    else
      url "https://github.com/davidahmann/wrkr/releases/download/v1.0.1/wrkr_1.0.1_darwin_amd64.tar.gz"
      sha256 "ee4e85dc71f687ecb3c0d4319f9b4c0942b0b59b4d3351e69c001b4e243136f4"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/davidahmann/wrkr/releases/download/v1.0.1/wrkr_1.0.1_linux_arm64.tar.gz"
      sha256 "7ff524970725bfe715b8df5122c8215d5a2783f92a10c40e7519c7f251517b00"
    else
      url "https://github.com/davidahmann/wrkr/releases/download/v1.0.1/wrkr_1.0.1_linux_amd64.tar.gz"
      sha256 "d82b621233ecebffab0e0ae4a839551f7d4c5ac4d0c7c948c38806666f0ee94d"
    end
  end

  def install
    bin.install "wrkr"
  end

  test do
    output = shell_output("#{bin}/wrkr --json version")
    assert_match '"version"', output
  end
end

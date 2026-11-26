# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '7.6.0'
  license 'MIT'

  depends_on macos: :ventura

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/7.6.0/asc_7.6.0_macOS_arm64'
      sha256 '89b46efd54a8ee0fe0432aaf3cd8b9adea9d23074f1c58f0f830847bf6943ba6'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/7.6.0/asc_7.6.0_macOS_amd64'
      sha256 '3a16e4dc615c3d93d0650ce77f4c15b604485ca7683c982033ff36404683b592'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_7.6.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_7.6.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

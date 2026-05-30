# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '1.7.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/1.7.0/asc_1.7.0_macOS_arm64'
      sha256 '37302b31ef868664158948fd4caa411c8ca673bbb0edcbc510731572f2aee418'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/1.7.0/asc_1.7.0_macOS_amd64'
      sha256 '2b8a275ce0846dab470207e3c599c057d45aa861b7720dd306c26f5ecb378edf'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_1.7.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_1.7.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end

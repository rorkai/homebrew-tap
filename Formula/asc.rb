# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '1.4.2'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/1.4.2/asc_1.4.2_macOS_arm64'
      sha256 'a3e227ba543edd220f8fe00e9826ecc7c8d724129a9eadbe22582e3e6e33b69f'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/1.4.2/asc_1.4.2_macOS_amd64'
      sha256 '076e46ea1575fda34e02b7f065642880f111dd26fae525d1562d7b5890f182b8'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_1.4.2_macOS_arm64' => 'asc'
    else
      bin.install 'asc_1.4.2_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end

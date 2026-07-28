# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '3.1.3'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/3.1.3/asc_3.1.3_macOS_arm64'
      sha256 'c4741f7fbc342444e6ab6f90115add962713e9a68f3388c3e5350d65d86a3d42'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/3.1.3/asc_3.1.3_macOS_amd64'
      sha256 '8d9469bf9c824bca3fc7cb54be213bdd2ed7161fb15cb053fd00b043a6bf761b'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_3.1.3_macOS_arm64' => 'asc'
    else
      bin.install 'asc_3.1.3_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end

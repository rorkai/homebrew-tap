# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '2.6.1'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/2.6.1/asc_2.6.1_macOS_arm64'
      sha256 '694d53312e2c2d475395dacc0c40423ce29eaf4c9d44663c66aa828f1563f4b9'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/2.6.1/asc_2.6.1_macOS_amd64'
      sha256 'ea7164984d875b886cec2aa4bc476c095007d62d7b664ffeb791beb1007c9ae7'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_2.6.1_macOS_arm64' => 'asc'
    else
      bin.install 'asc_2.6.1_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end

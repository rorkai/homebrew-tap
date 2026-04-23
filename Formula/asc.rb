# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '1.2.5'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/1.2.5/asc_1.2.5_macOS_arm64'
      sha256 '508a4f97dabfe3ea016b3447d281b3a9dd4e03d66eddfe34c994872aed8ad81b'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/1.2.5/asc_1.2.5_macOS_amd64'
      sha256 '33a00c4e049bcff1f8be5db72d83e2a4091280c409e32d55743086f4b1f429c1'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_1.2.5_macOS_arm64' => 'asc'
    else
      bin.install 'asc_1.2.5_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end

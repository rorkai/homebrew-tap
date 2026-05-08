# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '1.4.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/1.4.0/asc_1.4.0_macOS_arm64'
      sha256 '68c5259bb62ae9373c1c697703537fb3fdd636a76684347df6656404ce4c7067'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/1.4.0/asc_1.4.0_macOS_amd64'
      sha256 '6a499183830132b4a95cbcee1970378801f48a30be2b066795f962de4bd9992e'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_1.4.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_1.4.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match "asc is a fast, lightweight CLI for App Store Connect", shell_output("#{bin}/asc --help")
  end
end

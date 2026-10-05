# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '5.11.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.11.0/asc_5.11.0_macOS_arm64'
      sha256 '180f77a17dd81a4392bd4a8055d5544918961a0c3ea9bc184a1b16b8aaf1695e'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.11.0/asc_5.11.0_macOS_amd64'
      sha256 'f556769589bb9de8a10d711e4fe4b654203b316bd24cc4eaf9d765b955167287'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_5.11.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_5.11.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

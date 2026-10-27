# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '5.17.1'
  license 'MIT'

  depends_on macos: :ventura

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.17.1/asc_5.17.1_macOS_arm64'
      sha256 'f7d9882127854f36aa2b00cd935d5f76a3a4faae955980d3c91f2c0158d688d8'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.17.1/asc_5.17.1_macOS_amd64'
      sha256 '5a71dbd252afd73bcf361770449eb5187530f794b6c29abcec3618b485533d53'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_5.17.1_macOS_arm64' => 'asc'
    else
      bin.install 'asc_5.17.1_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end

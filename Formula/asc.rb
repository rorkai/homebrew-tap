# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '6.0.0'
  license 'MIT'

  depends_on macos: :ventura

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/6.0.0/asc_6.0.0_macOS_arm64'
      sha256 '783e81b1c85a02164b53428e5024f32fd140a034d272263be64e6e6bd5ca91ea'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/6.0.0/asc_6.0.0_macOS_amd64'
      sha256 'ffc9167d5528beee4bde97f40dbab5cb4f30f23014b130dc6dbb865f2ab7c8d8'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_6.0.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_6.0.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
